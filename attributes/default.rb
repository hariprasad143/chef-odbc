default['odbc']['drivers'] = []
default['odbc']['devel'] = false
default['odbc']['source']['version'] = '2.3.0'
default['odbc']['source']['url'] = 'ftp://ftp.unixodbc.org/pub/unixODBC'
default['odbc']['source']['cppflags'] = '-DSIZEOF_LONG_INT=8'

## Driver Defaults
## Microsoft Native SQL ODBC Driver
default['odbc']['driver']['microsoft']['source_url'] = "https://s3-us-west-2.amazonaws.com/metasphere/odbc/drivers/microsoft/RHEL#{node['platform_version'].to_i}/msodbcsql-11.0.2270.0.tar.gz"