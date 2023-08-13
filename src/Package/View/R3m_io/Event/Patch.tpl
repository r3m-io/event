{{R3M}}
{{$request = request()}}
{{$class = 'Event'}}
{{$options = options()}}

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
{/if}
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
{/if}
{{if($options.action)}}
{{$action = data.extract('options.action')}}
{{$is.update.action = true}}
{{/if}}
{{if($options.options.priority)}}
{{$options.priority = data.extract('options.options.priority')}}
{{$is.update.options.priority = true}}
{{/if}}
{{$uuid = data.extract('options.action')}}
{{$response = R3m.Io.Node:Data:read(
$class,
R3m.Io.Node:Role:role_system(),
[
'uuid' => $uuid,
])}}
{{d($response)}}
{{d($uuid)}}
{{dd($action)}}
{{$response|json.encode:'JSON_PRETTY_PRINT'}}

