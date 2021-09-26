FROM raspbian/stretch

RUN apt update

# install a bunch of admin tools
RUN apt install -y sudo nmap tcpdump openssh-server rsync curl vim

# to generate hosts keys, start service once
RUN service ssh start

# add admin user
RUN useradd -rm -d /home/admin -s /bin/bash -g root -G sudo -u 1000 admin
# for password login and sudo usage needed
RUN  echo 'admin:admin' | chpasswd
RUN mkdir /home/admin/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDvQeAulL2W1T7+8lEEfI1Vkw1KPF7i7Hy8dX8itJgrOzO0FJuL6bb2wmBrNn3K9jeNgnDTdfdOykXI3r9kuKZvDvSA1Ri49mTLe7+7vlLGR3iSojClWE7faSJd66hLXvH/s5EXMw6yV/vnl5S/nXq3W4EA/f5IrRLCVK2IKdt+Nz9tvVp+/HLMdi4daFcz1Kyh3OiM2jBIbXOu/fB9ucV4UsGFiMuh12OACNuDSKvd6YUdo1nqXx+R+i4bJuhwPwKLvYRvnhREBQSQhv4sDAfwjnlfs2WvUzBwKEY4oPyBAB7TehuVA8OQ0m3lvwSGF50KVEl9Y7uUTHrMfU3U6mwh mesznera@ws00007999" > /home/admin/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
