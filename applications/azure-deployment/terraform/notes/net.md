This file contains some notes about the network 

#  1 - Virtual Network (VNet)

###    **What It Is**:

   A Virtual Network (VNet) is a representation of your own network in the cloud. It is similar to an on-premises network but in Azure, and it provides isolation and security for your resources.

### **What It Does**:

1. [ ] Allows Azure resources (like `VMs`, `databases`, and `apps`) to securely communicate with each other.
2. [ ] Supports inbound and outbound communication to the internet.
3. [ ] Can be connected to other VNets or on-premises networks via VPN or ExpressRoute.

### **Configurations:**
```hcl
resource "azurerm_virtual_network" "vnet" {
name                = "tayssir-vnet"
address_space       = ["10.0.0.0/16"]
location            = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
}
```
- **name**: The name of the VNet.
- **address_space**: The IP range available within the VNet. The 10.0.0.0/16 range allows for 65,536 IP addresses, making it suitable for various subnets.
- **location**: Specifies the Azure region where the VNet will be created.
- **resource_group_name**: Associates the VNet with the specified resource group.

### **Key Concepts:**

- **CIDR (Classless Inter-Domain Routing)***: Defines the range of IP addresses available in the VNet. Here, 10.0.0.0/16 indicates a network with 65,536 IP addresses.
- **Isolation**: VNets are isolated from each other by default, providing security and control over network traffic.

#  2 - Subnet
### **What It Is**:
A subnet is a range of IP addresses within your VNet. Subnets allow you to segment your network to organize and secure your resources more efficiently.

### **What It Does:**

- Segments the VNet into smaller, manageable sections.
- Allows applying different security rules and configurations to different parts of the network.
- Resources within the same subnet can communicate directly with each other, but communication between subnets requires routing.
### **Configurations:**
```hcl
resource "azurerm_subnet" "subnet" {
name                 = "tayssir-subnet"
resource_group_name  = azurerm_resource_group.rg.name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes     = ["10.0.1.0/24"]
}
```
- **name**: The name of the subnet.
- **resource_group_name**: Associates the subnet with the resource group.
- **address_prefixes**: Defines the IP range for the subnet. Here, 10.0.1.0/24 provides 256 IP addresses.
### **Key Concepts:**

**Subnetting**: The process of dividing a network into smaller networks. In this example, 10.0.1.0/24 is a smaller segment of the 10.0.0.0/16 network.
**Routing**: Traffic between subnets is routed through the VNet, which allows for control and security.
#  3 - Public IP Address
### **What It Is**: 
A Public IP Address is an IP address that can be accessed over the internet. It's essential for resources that need to be reachable from outside the VNet (like a web server).

#### **What It Does**:

- Allows resources to communicate with the internet.
- Provides a unique identifier for your resource that is visible externally.
### **Configurations**:

```hcl
resource "azurerm_public_ip" "public_ip" {
name                = "tayssir-public-ip"
resource_group_name = azurerm_resource_group.rg.name
location            = azurerm_resource_group.rg.location
allocation_method   = "Dynamic"
}
```
- **name**: The name of the Public IP resource.
- **resource_group_name**: Associates the Public IP with the resource group.
- **location**: Specifies the Azure region where the Public IP will be created.
- **allocation_method**: Defines how the IP address is assigned. Dynamic means the IP is assigned when the resource is created and can change, while Static means it stays the same.
### **Key Concepts**:

**Dynamic vs. Static IP:** Dynamic IPs can change and are generally used for non-critical services, while Static IPs remain constant and are used for services where the IP must not change (e.g., DNS settings).
# 4 - Network Security Group (NSG)
   ### **What It Is**:
   A Network Security Group is a set of security rules that control inbound and outbound traffic to resources within a VNet.

### **What It Does**:

- Allows you to define rules that permit or deny traffic to/from your resources.
- Provides a basic layer of security by controlling the flow of traffic at the network level.
### **Configurations**:

```hcl
resource "azurerm_network_security_group" "nsg" {
name                = "tayssir-nsg"
location            = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
}
```
- name: The name of the NSG.
- location: Specifies the Azure region where the NSG will be created.
- resource_group_name: Associates the NSG with the resource group.
### **Key Concepts**:

- **Security Rules**: NSGs can contain rules that allow or deny traffic based on source IP, destination IP, port, and protocol.
- **Inbound/Outbound Rules**: Inbound rules control incoming traffic to a resource, while outbound rules control outgoing traffic.

# 5 - Network Interface
  ### **What It Is**:
   A Network Interface is the network adapter that connects a virtual machine to a VNet, allowing the VM to communicate over the network.

### **What It Does**:

Connects the VM to the VNet and allows it to communicate with other resources, the internet, or on-premises networks.
### **Configurations**:

```hcl
resource "azurerm_network_interface" "nic" {
name                = "tayssir-nic"
location            = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
ip_configuration {
name                          = "internal"
subnet_id                     = azurerm_subnet.subnet.id
private_ip_address_allocation = "Dynamic"
public_ip_address_id          = azurerm_public_ip.public_ip.id
}
}
```
- **name**: The name of the Network Interface.
- **location**: Specifies the Azure region where the Network Interface will be created.
- **resource_group_name**: Associates the Network Interface with the resource group.
- **ip_configuration**: Contains settings for the IP configuration, including subnet, private IP, and public IP.
- **subnet_id**: Links the Network Interface to the specific subnet.
- **private_ip_address_allocation**: Defines whether the private IP is Dynamic (changes) or Static (remains the same).
- **public_ip_address_id**: Associates a Public IP with the Network Interface, enabling external communication.
### **Key Concepts**:

- **Private vs. Public IP**: A Network Interface can have both a private IP (for internal communication within the VNet) and a public IP (for external communication).
- **IP Configuration** : Determines how the network interface handles IP addresses, routing, and security.
