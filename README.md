# Datadog demo

A demo application to spit out some logs and run the Datadog agent.
That's it.

# What's here

Three containers that spit out logs every few seconds saying "Hello
from app [number]!", plus the Datadog agent container.

# How to run it

Export the DD API key and push:

```
export DD_API_KEY=[secret datadog API key]
balena push [app or IP] --env datadog:DD_API_KEY=${DD_API_KEY}
```

Alternately, you could add a service variable to your application.


`datadog/startup.sh` sets the hostname for the agent to the device
UUID, sets the API key so it can register with DD, and adds all
environment variables that start with `BALENA_` as tags.

# TODO

- Get DD agent to see host proc/sys filesystem
- Be careful about which tags we add -- would not want to add balena API
  keys, say
- Don't use `sed` to crowbar environment variables into YAML
- More testing 

