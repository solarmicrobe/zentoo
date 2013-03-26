provides "linux/lxc_virtualization"
require_plugin "virtualization"

unless virtualization[:system]
  if File.exists?("/proc/1/cgroup")
    if File.read("/proc/1/cgroup").match(/^\d+:.+:lxc\/.+$/)
      virtualization[:system] = "linux-lxc"
      virtualization[:role] = "guest"
    elsif File.read("/proc/1/cgroup").match(/^\d+:.+:\/$/) && File.exist?("/usr/sbin/lxc-start")
      virtualization[:system] = "linux-lxc"
      virtualization[:role] = "host"
    end
  end

  if virtualization[:system] == "linux-lxc" && virtualization[:role] == "host"
    virtualization[:lxc] = Mash.new
    virtualization[:lxc][:guests] = {}

    lxc_guests = %x{lxc-ls}.split.uniq
    lxc_running =  %x{lxc-ls --active}.split.uniq

    lxc_guests.each do |guest|
      virtualization[:lxc][:guests][guest] = {}
      virtualization[:lxc][:guests][guest][:running] = false
    end

    lxc_running.each do |guest|
      virtualization[:lxc][:guests][guest][:running] = true
    end
  end
end
