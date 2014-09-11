unixodbc_deps = %w{ gcc openssl-devel }
unixodbc_deps.each do |pkg|
  package pkg do
    action :install
  end
end

source_url = node['odbc']['source']['url']
file_name = "unixODBC-#{node['odbc']['source']['version']}"
extn = '.tar.gz'
url = "#{source_url}#{file_name+extn}"

Chef::Log.info('Installing unixODBC From Source')

kernel_bit = ''
if node['kernel']['machine'] == 'x86_64'
  kernel_bit = '64'
end

Chef::Log.info("#{kernel_bit}")
Chef::Log.info("#{url}")

bash 'install-unixodbc' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar -zxvf #{file_name+extn}
    (cd #{file_name} && ./configure --prefix=/usr --libdir=/usr/lib#{kernel_bit} --sysconfdir=/etc --enable-gui=no --enable-drivers=no --enable-iconv --with-iconv-char-enc=UTF8 --with-iconv-ucode-enc=UTF16LE && make && make install)
    EOH
    environment({'CPPFLAGS' => node['odbc']['source']['cppflags']})
  action :nothing

end

remote_file File.join(Chef::Config[:file_cache_path], file_name+extn) do
  source url
  owner 'root'
  mode 0644
  checksum node['odbc']['source']['checksum']
  use_conditional_get true
  notifies :run, 'bash[install-unixodbc]', :immediately
end