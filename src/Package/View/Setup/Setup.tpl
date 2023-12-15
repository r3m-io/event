{{R3M}}
{{$register = Package.R3m.Io.Event:Init:register()}}
{{if(!is.empty($register))}}
{{Package.R3m.Io.Event:Import:event.action()}}
Import System.Event.Action
Import System.Event
{{/if}}