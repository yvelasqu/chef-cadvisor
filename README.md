cadvisor Cookbook
=================

Installs and runs Google's cadvisor (https://github.com/google/cadvisor)

Requirements
------------

* Cookbook docker


Attributes
----------

Attributes are self documented in `attributes/*`

Usage
-----
#### cadvisor::default

Just include `cadvisor` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cadvisor]"
  ]
}
```

# chef-cadvisor
