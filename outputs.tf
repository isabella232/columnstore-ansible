resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
       public-ip1 = aws_instance.pm1.public_ip,
       public-ip2 = aws_instance.pm2.public_ip,
       public-ip3 = aws_instance.pm3.public_ip,
       public-ip4 = aws_instance.mx1.public_ip,
       private-ip1 = aws_instance.pm1.private_ip,
       private-ip2 = aws_instance.pm2.private_ip,
       private-ip3 = aws_instance.pm3.private_ip,
       private-ip4 = aws_instance.mx1.private_ip,
    }
  )
  filename = "inventory/hosts"
}
