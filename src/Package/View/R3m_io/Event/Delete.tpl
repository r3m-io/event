{{R3M}}
{{$class = 'Event'}}
{{$options = options()}}
{{if(is.empty($options.uuid))}}
You can use list to get the uuid.
{{$options.uuid = terminal.readline('Uuid: ')}}
{{/if}}
{{$delete = R3m.Io.Node:Data:delete(
$class,
R3m.Io.Node:Role:role_system(),
[
'uuid' => $options.uuid
])}}
{{if(is.empty($delete))}}
Delete failed: {{$options.uuid}}

Class: {{$class}}
{{/if}}