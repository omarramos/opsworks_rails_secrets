opsworks\_rails\_secrets
===================

Rails 4.1 cookbook to inject the secrets.yml into the shared config folder.

To use just specify the secrets in the [stack's custom JSON](http://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html). Example:

    {
      "secrets": {
        "app_shortname": {
          "production": {
            "my_secret": "my_secret_value"
          }
        }
      },
      
      "deploy": {
        "app_shortname": {
          "symlink_before_migrate": {
            "config/secrets.yml": "config/secrets.yml"
          }
        }
      }
    }

Opsworks Set-Up
---------------

* Add `secrets`, `deploy_to`, and `symlink_before_migrate` attributes to the stack's custom JSON as in the example above.
* Associate the `opsworks_rails_secrets::configure` custom recipe with the _Deploy_ event in your rails app's layer.

A deploy isn't necessary if you just want to update the custom configuration. Instead, update the stack's custom JSON, then choose to _Run Command_ > _execute recipes_ and enter `opsworks_rails_secrets::configure` into the _Recipes to execute_ field. Executing the recipe will write an updated `secrets.yml` file and restart unicorn workers.

Copyright and License
-------

(c) 2014 Omar Ramos, [DigitalTree](http://digitaltree.com). See [LICENSE](LICENSE) for details.

Thanks
------

Special thanks to [Joey Aghion](https://github.com/joeyAghion/opsworks_custom_env) for providing the base of this cookbook.
