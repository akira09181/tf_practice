resource "aws_network_interface" "for_public_subnet_1a" {
  subnet_id       = aws_subnet.public_subnet_1a.id
  private_ips     = ["10.0.0.50"]
  security_groups = [aws_security_group.web_sg.id]
}
resource "aws_network_interface" "for_public_subnet_1c" {
  subnet_id       = aws_subnet.public_subnet_1c.id
  private_ips     = ["10.0.0.70"]
  security_groups = [aws_security_group.web_sg.id]
}
resource "aws_network_interface" "for_private_subnet_1a" {
  subnet_id       = aws_subnet.private_subnet_1a.id
  private_ips     = ["10.0.1.70"]
  security_groups = [aws_security_group.web_sg.id]
}
resource "aws_network_interface" "for_private_subnet_1c" {
  subnet_id       = aws_subnet.private_subnet_1c.id
  private_ips     = ["10.0.2.50"]
  security_groups = [aws_security_group.web_sg.id]
}
resource "aws_network_interface" "for_private_subnet4_1a" {
  subnet_id       = aws_subnet.private_subnet4_1a.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.web_sg.id]
}
resource "aws_network_interface" "for_private_subnet4_1a_2" {
  subnet_id       = aws_subnet.private_subnet4_1a_2.id
  private_ips     = ["10.0.1.133"]
  security_groups = [aws_security_group.web_sg.id]
}
resource "aws_network_interface" "for_private_subnet_iot_1c" {
  subnet_id       = aws_subnet.private_subnet_iot_1c.id
  private_ips     = ["10.49.92.40"]
  security_groups = [aws_security_group.web_sg_iot.id]
}
resource "aws_network_interface" "for_private_subnet_iot_1a" {
  subnet_id       = aws_subnet.private_subnet_iot_1a.id
  private_ips     = ["10.49.92.10"]
  security_groups = [aws_security_group.web_sg_iot.id]
}