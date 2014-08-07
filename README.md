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
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['odbc']['source']['version']</tt></td>
    <td>String</td>
    <td>unixODBC version to install from source</td>
    <td><tt>2.3.0</tt></td>
  </tr>
    <tr>
    <td><tt>['odbc']['source']['url']</tt></td>
    <td>String</td>
    <td>unixODBC remote url base</td>
    <td><tt>ftp://ftp.unixodbc.org/pub/unixODBC</tt></td>
  </tr>
  </tr>
    <tr>
    <td><tt>['odbc']['source']['cppflags']</tt></td>
    <td>String</td>
    <td>Additional CPPFLAGS used when compiling</td>
    <td><tt>-DSIZEOF_LONG_INT=8</tt></td>
  </tr>
</table>

#### odbc::drivers
##### Microsoft ODBC Driver 11
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['odbc']['driver']['microsoft']['source_url']</tt></td>
    <td>String</td>
    <td>Base url for odbc driver</td>
    <td><tt>https://s3-us-west-2.amazonaws.com/metasphere/odbc/drivers/microsoft/RHEL#{node['platform_version'].to_i}/msodbcsql-11.0.2270.0.tar.gz</tt></td>
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