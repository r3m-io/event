<?php
namespace Package\R3m\Io\Event\Trait;

use R3m\Io\App;

use R3m\Io\Module\Core;
use R3m\Io\Module\File;

use R3m\Io\Node\Model\Node;

use Exception;
trait Init {

    /**
     * @throws Exception
     */
    public function action()
    {
        $object = $this->object();
        $class = 'System.Event.Action';
        $url = $object->config('project.dir.vendor') .
            'r3m_io/event/Data/' .
            $class .
            $object->config('extension.json')
        ;
        ddd($url);
    }
}