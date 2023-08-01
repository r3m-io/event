{{R3M}}
{{$package = 'R3m_io/Event'}}
{{$options = options()}}
{{$is.all = false}}
{{if(is.empty.object($options))}}
{{$is.all = true}}
{{/if}}
{{$files = dir.read(config('controller.dir.view') + dir.uppercase.first($package) + 'Info/')}}
{{$files = data.sort($files, ['url' => 'ASC'])}}
{{for.each($files as $file)}}
{{if($file.name == 'Info.tpl')}}
{{continue()}}
{{/if}}
{{$file.basename = file.basename($file.name, config('extension.tpl'))}}
{{if(!is.empty($options[$file.basename|lowercase]) || !is.empty($is.all))}}
{{require($file.url)}}
{{/if}}
{{/for.each}}