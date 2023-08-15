{{R3M}}
{{$request = request()}}
{{$class = 'Event'}}
{{$options = options()}}
{{$response = R3m.Io.Node:Data:put(
$class,
R3m.Io.Node:Role:role_system(),
$options
)}}
{{$response|json.encode:'JSON_PRETTY_PRINT'}}

