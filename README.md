# cancancan bug

If you pass namespaced parameters to `#new` in a controller that uses `load_resource`, it will always fail with an ActiveModel::ForbiddenAttributesError.

This is because in the case where action is not in param_actions, we return the parameter subhash without any strong parameter checking. 
That would be fine if it were a hash, but in this case [resource_params](https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/controller_resource.rb#L222) always returns an object of type ActionController::Parameters.
Because it responds_to? :permitted?, ActiveModel will reject it unless it actually is permitted?

My preferred fix is just to add :new to param_actions, but perhaps that has unwelcome side effects?
A more direct alternative is just to call permit! on the returned parameters.


