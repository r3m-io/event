<?php
namespace Package\R3m\Io\Event\Trait;

use R3m\Io\App;

use R3m\Io\Module\Core;
use R3m\Io\Module\File;

use R3m\Io\Node\Model\Node;

use Exception;
trait Import {

    public function role_system(): void
    {
        $object = $this->object();
        $node = new Node($object);
        $node->role_system_create('r3m_io/event');
    }

    /**
     * @throws Exception
     */
    public function event_action(): void
    {
        $object = $this->object();
        $options = App::options($object);
        $class = 'System.Event.Action';
        $url = $object->config('project.dir.vendor') .
            'r3m_io/event/Data/' .
            $class .
            $object->config('extension.json')
        ;
        $data = $object->data_read($url);
        $node = new Node($object);
        $create_many = [];
        $put_many = [];
        if($data){
            foreach($data->data($class) as $nr => $record){
                $record_options = [
                    'where' => [
                        [
                            'value' => $record->action,
                            'attribute' => 'action',
                            'operator' => '===',
                        ]
                    ]
                ];
                $response = $node->record($class, $node->role_system(), $record_options);
                if(!$response){
                    $create_many[] = $record;
                }
                elseif(property_exists($options,'force')){
                    $put_many[] = $record;
                }
            }
        }
        if(!empty($create_many)){
            $response = $node->create_many($class, $node->role_system(), $create_many);
            d($response);
        }
        if(!empty($put_many)){
            $response = $node->put_many($class, $node->role_system(), $put_many);
            d($response);
        }
        //create_many
        //put_many
        //patch_many
        ddd($url);
    }
}