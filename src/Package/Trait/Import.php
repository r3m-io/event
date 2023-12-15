<?php
namespace Package\R3m\Io\Event\Trait;

use R3m\Io\App;

use R3m\Io\Module\Core;
use R3m\Io\Module\File;

use R3m\Io\Node\Model\Node;

use Exception;
trait Import {

    /**
     * @throws Exception
     */
    public function event_action(): void
    {
        $object = $this->object();
        $class = 'System.Event.Action';
        $url = $object->config('project.dir.vendor') .
            'r3m_io/event/Data/' .
            $class .
            $object->config('extension.json')
        ;
        $data = $object->data_read($url);
        if($data){
            foreach($data->data($class) as $nr => $record){
                d($record);

            }
        }
        //create_many
        //put_many
        //patch_many
        ddd($url);
    }
}