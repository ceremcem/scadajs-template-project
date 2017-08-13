require! 'dcs': {Actor, TCPProxyClient}
require! 'colors': {bg-yellow}

class Monitor extends Actor
    (name='') ->
        super "Monitor #{name}"
        @subscribe '**'
        @log.log "subscribed: #{@subscriptions}"

        @on \receive, (msg) ~>
            if \update of msg
                @log.log "***update message: ", msg.update, "\t\ttopic: ", msg.topic
            if \payload of msg
                @log.log "payload: ", msg.payload, bg-yellow "topic: ", msg.topic

    action: ->
        @log.log "#{@name} started..."


new Monitor \test
new TCPProxyClient port: 5588 .login {user: "monitor", password: "test"}
