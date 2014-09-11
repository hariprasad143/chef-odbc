Chef::Log.info("Installing unixODBC Drivers #{node['odbc']['drivers'].join(' ')}")

## Install the Microsoft Native SQL Server ODBC Driver
## The Driver is only available for RHEL Systems
case node['platform_family']
when 'rhel','fedora'
  if node['odbc']['drivers'].include? "microsoft"
    url = node['odbc']['driver']['microsoft']['source_url']
    uri = URI.parse(url)
    
    file_name = uri.path.split('/').last.chomp!('.tar.gz')
    file_ext = '.tar.gz'

    Chef::Log.debug("Driver Filename #{file_name}")
    Chef::Log.debug("Driver Extension #{file_ext}")

    kernel_bit = ''
    if node['kernel']['machine'] == 'x86_64'
      kernel_bit = '64'
    end

    bash 'install-mssql-driver' do
      cwd Chef::Config[:file_cache_path]
      code <<-EOH
        tar -zxvf #{file_name+file_ext}
        (cd #{file_name} && ./install.sh install --lib-dir=/usr/lib#{kernel_bit} --accept-license)
        EOH
      not_if { ::File.exists?("/usr/lib#{kernel_bit}/libmsodbcsql-11.0.so.2270.0") }
      action :nothing
    end

    remote_file File.join(Chef::Config[:file_cache_path], file_name+file_ext) do
      source url
      owner 'root'
      mode 0644
      notifies :run, 'bash[install-mssql-driver]', :immediately
    end
  end

  if node['odbc']['drivers'].include? "freetds"

    version = node['odbc']['driver']['freetds']['version']
    file_name = "freetds-#{version}"
    file_ext = ".tar.gz"

    url = "#{node['odbc']['driver']['freetds']['source_url']}#{file_name}#{file_ext}"

    bash 'install-freetds-driver' do
      cwd Chef::Config[:file_cache_path]
      code <<-EOH
        tar -zxvf #{file_name}#{file_ext}
        (cd #{file_name} && ./configure && make && make install)
        EOH
      #not_if { ::File.exists?("/usr/lib#{kernel_bit}/libmsodbcsql-11.0.so.2270.0") }
      action :nothing
    end

    remote_file File.join(Chef::Config[:file_cache_path], file_name+file_ext) do
      source url
      owner 'root'
      mode 0644
      notifies :run, 'bash[install-freetds-driver]', :immediately
    end
  end
end