case node['platform_family']
  
when "rhel", "fedora"
  yum_package 'unixODBC'
  yum_package 'unixODBC-devel' if node['odbc']['devel']
end