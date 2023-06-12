sudo apt update && sudo apt upgrade
sudo apt install unbound
sudo mov pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
sudo mov 99-edns.conf /etc/dnsmasq.d/99-edns.conf
sudo systemctl disable --now unbound-resolvconf.service
sudo sed -Ei 's/^unbound_conf=/#unbound_conf=/' /etc/resolvconf.conf
sudo rm /etc/unbound/unbound.conf.d/resolvconf_resolvers.conf
sudo systemctl restart unbound
