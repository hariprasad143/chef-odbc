odbc Cookbook
=============
Installs and configured unixODBC. Optionally install a set of drivers

Requirements
------------


Attributes
----------

#### odbc::source
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['odbc']['drivers']</tt></td>
    <td>Array</td>
    <td>List of optional drivers to install. Includes :microsoft, :freetds, :postgresql, :mysql</td>
    <td><tt>[]]</tt></td>
  </tr>
  <tr>
    <td><tt>['odbc']['devel']</tt></td>
    <td>Boolean</td>
    <td>Install the devel package when installing from </td>
    <td><tt>[]]</tt></td>
  </tr>
</table>

Usage
-----
#### odbc::source

Just include `odbc::source` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[odbc::source]"
  ]
}
```

#### odbc::source

Just include `odbc::drivers` in your node's `run_list` and pass an array of acceptable drivers as symbols:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[odbc::drivers]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Justin Schneck