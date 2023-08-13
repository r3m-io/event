{{R3M}}
{{$request = request()}}
{{$class = 'Event'}}
{{$options = options()}}
{{if(!$options.page)}}
{{$options.page = 1}}
{{/if}}
{{if(!$options.limit)}}
{{$options.limit = 255}}
{{/if}}
{{if($options.format === 'json')}}
{{else}}
Update Event:

{{/if}}
{{if(is.empty($options.uuid))}
You can view the uuid of the event by using the command: {{binary()}} {{$request.package}} list
{{$options.uuid = terminal.readline('Uuid: ')}}
{/if}

{{$uuid = $options.uuid}}
{{if(!is.empty($options.action))}}
{{$action = $options.action}}
{{/if}}

{{if(!is.empty($options.options))}}
{{$options = $options.options}}
{{/if}}



{{$response = R3m.Io.Node:Data:list(
$class,
R3m.Io.Node:Role:role.system(),
[
'sort' => [
'options.priority' => 'ASC',
'action' => 'ASC'
],
"#where" => [
'(',
[
'attribute' => 'options.priority',
'value' => 11,
'operator' => '==='
],
'and',
[
'attribute' => 'options.priority',
'value' => 10,
'operator' => '==='
],
')'
],
'#where' => '
(
    options.priority === 1
    xor
    (
        options.priority === 11
        and
        action === "yyy"
    )
    xor
    (
        options.priority === 12
        and
        action === "utyrrt"
    )
)',
'filter' => [
    'options.priority' => [
    'value' => 11,
    'operator' => '==='
    ]
],
'limit' => (int) $options.limit,
'page' => (int) $options.page
])}}
{{dd($response)}}

{{if(is.array($response.list))}}
{{for.each($response.list as $nr => $role)}}
{{$selector = $nr + 1}}
[{{$selector}}] {{$role.name}} ({{$role.rank}})
{{/for.each}}
{{/if}}
{{$roles = $options.role}}
{{if(is.empty($roles))}}
{{$roles = terminal.readline('Role: ')}}
{{/if}}
{{$roles = preg_replace('/\s+/', ' ', $roles)}}
{{$roles = string.replace(', ', ',', $roles)}}
{{if(string.contains.case.insensitive($roles, 'all'))}}
{{$roles = $response.list}}
{{else}}
{{$roles = explode(',', $roles)}}
{{for.each($roles as $nr => $selector)}}
{{$selector = (int) $selector}}
{{if(array.key.exist($selector - 1, $response.list))}}
{{$roles[$nr] = $response.list[$selector - 1]}}
{{/if}}
{{/for.each}}
{{/if}}
{{if(is.array($roles))}}
{{for.each($roles as $nr => $role)}}
{{$patch.uuid = $role.uuid}}
{{if($options.rank)}}
{{$patch.rank = (int) $options.rank}}
{{/if}}
{{if($options.name)}}
{{$patch.name =  $options.name}}
{{/if}}
{{$response = R3m.Io.Node:Data:patch('Role', $patch)}}
{{/for.each}}
{{/if}}
{{$response|json.encode:'JSON_PRETTY_PRINT'}}
