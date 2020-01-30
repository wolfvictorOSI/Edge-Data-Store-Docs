---
uid: DeleteConfiguration
---

# Delete configuration

## Delete configuration entry

Complete the following to delete a configuration entry from a collection configuration in Edge Data Store. For example, you could delete a single health endpoint of the 'HealthEndpoints' facet within the 'System' component.

1. Open command line. 
2. Type the `componentId` and `facetName` followed by the ID of the entry to be removed.
3. Add the `delete` keyword and press Enter.

   Example deleting endpoint_1 of the HealthEndpoints facet from the System:

   ```bash
      edgecmd Configuration System HealthEndpoints Id=endpoint_1 delete
   ```

## Delete configuration file

Complete the following to delete a configuration file from Edge Data Store. For example, you could delete the configuration file of the 'HealthEndpoints' facet within the 'System' component.

1. Open command line. 
2. Type the `componentId` and `facetName`.
3. Add the `delete` keyword and press Enter.

   Example deleting HealthEndpoints facet configuration file:

   ```bash
      edgecmd Configuration System HealthEndpoints delete
   ```

