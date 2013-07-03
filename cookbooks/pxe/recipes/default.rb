package "tftpd-hpa"
package "dhcp3-server"

execute "pxe" do
  command "echo 'Hello from Chef!'"
  action :run
end
