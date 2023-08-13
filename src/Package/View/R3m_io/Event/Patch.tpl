{{R3M}}
{{$request = request()}}
{{$class = 'Event'}}
{{$options = options()}}
{{dd($options)}}
{{if($options.options.command)}}
{{$explode_commands = explode(',', data.extract('options.options.command'))}}
{{$commands = []}}
{{if(is.array($explode_commands))}}
{{foreach($explode_commands as $nr => $command)}}
{{$command = string.trim($command)}}
{{if(!is.empty($command))}}
{{$commands[$nr] = $command}}
{{/if}}
{{/foreach}}
{{/if}}
{{$is.update.options.command = true}}
{{$options.command = $commands}}
{{/if}}
{{if($options.options.controller)}}
{{$explode_controllers = explode(',', data.extract('options.options.controller'))}}
{{$controllers = []}}
{{if(is.array($explode_controllers))}}
{{foreach($explode_controllers as $nr => $controller)}}
{{$controller = string.trim($controller)}}
{{if(!is.empty($controller))}}
{{$controllers[$nr] = $controller}}
{{/if}}
{{/foreach}}
{{/if}}
{{$is.update.options.controller = true}}
{{$options.controller = $controllers}}
{{/if}}
{{if($options.action)}}
{{$action = data.extract('options.action')}}
{{$is.update.action = true}}
{{/if}}
{{if($options.options.priority)}}
{{$options.priority = data.extract('options.options.priority')}}
{{$is.update.options.priority = true}}
{{/if}}
{{$uuid = data.extract('options.uuid')}}
{{$node = []}}
{{$node['uuid'] = $uuid}}
{{$node['action'] = $action}}
{{$node['options'] = []}}
{{$node['options']['priority'] = $options.priority}}
{{$node['options']['command'] = $options.command}}
{{$node['options']['controller'] = $options.controller}}
{{dd($node)}}
/*
{{$response = R3m.Io.Node:Data:put(
$class,
R3m.Io.Node:Role:role_system(),
[
'uuid' => $uuid,
'action' => $action,
'options.priority' => $options,
]
)}}
*/
/*
{{$response = R3m.Io.Node:Data:read(
$class,
R3m.Io.Node:Role:role_system(),
[
'uuid' => $uuid,
])}}
{{if($response.node)}}
{{if($is.update.options.priority)}}
{{$response.node.options.priority = $options.priority}}
{{/if}}
{{if($is.update.options.command)}}
{{$response.node.options.command = $options.command}}
{{/if}}
{{if($is.update.options.controller)}}
{{$response.node.options.controller = $options.controller}}
{{/if}
{{if($is.update.action)}}
{{$response.node.options.action = $action}}
{{/if}}
{{/if}}
*/

{{d($response)}}
{{d($uuid)}}
{{dd($action)}}
{{$response|json.encode:'JSON_PRETTY_PRINT'}}

