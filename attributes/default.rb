default['odbc']['drivers'] = []
default['odbc']['devel'] = false
default['odbc']['source']['version'] = '2.3.2'
default['odbc']['source']['checksum'] = '5e4528851eda5d3d4aed249b669bd05b'
default['odbc']['source']['url'] = 'ftp://ftp.unixodbc.org/pub/unixODBC/'
default['odbc']['source']['cppflags'] = '-DSIZEOF_LONG_INT=8'

## Driver Defaults
## Microsoft Native SQL ODBC Driver
default['odbc']['driver']['microsoft']['source_url'] = "https://s3-us-west-2.amazonaws.com/metasphere/odbc/drivers/microsoft/RHEL#{node['platform_version'].to_i}/msodbcsql-11.0.2270.0.tar.gz"

## FreeTDS
default['odbc']['driver']['freetds']['source_url'] = "ftp://ftp.freetds.org/pub/freetds/stable/"
default['odbc']['driver']['freetds']['version'] = "0.92.79"
default['odbc']['driver']['freetds']['checksum'] = 'b97e9bdd3f461af3e8ea559404582f70'