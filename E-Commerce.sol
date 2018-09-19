pragma solidity ^0.4.25

contract BlockChain_Store{
    
    mapping(address => Seller) sellers;
    mapping(address=> Buyer) buyers;
    mapping(uint256 => Product) products;
    
    function BlockChain_Store() public
    {
        seller_Address = _address;
        
    }
    
    modifier onlySeller{
        require(_adress = seller_Address)
        _;
    }
    
    struct Customer
    {
        string Name;
        address seller_Address;
        address buyer_Address;
        string PrivateKey;
        string Role;
        Cart cart;
        string constant seller;
        string constant buyer;
    }
    
    struct Product
    {
        uint256 id;
        string name;
        uint256 Price;
        uint256 default_amount;
        string description;
    }
    
    function newSeller(address _selleraddress, string _name, string _privatekey) returns (bool success)
    {
        if(_selleraddress != address(0))
        {
        Customer storage customer = customers({Name : _name, seller_Address: _selleraddress, PrivateKey : _privatekey })
        customers[_selleraddress] = customer;
        CustomerRegistered(_selleraddress);
        return true;
        }
        {
        CustomerRegistrationFailed(_selleraddress);
        return false;
        }
    }
    
    function newBuyer(address _buyeraddress, string _name, string _privatekey) returns (bool success)
    {
        if(_buyeraddress != address(0))
        {
        Customer storage customer = customers({Name : _name, buyer_Address: _buyeraddress, PrivateKey : _privatekey })
        customers[_buyeraddress] = customer;
        CustomerRegistered(_buyeraddress);
        return true;
        }
        {
        CustomerRegistrationFailed(_buyeraddress);
        return false;
        }
    }
    
    function ProductRegistration(uint256 _id, string _name, uint256 _price, uint256 _default_amount, string _description) onlyCustomer  returns (bool succes)
    {
        
    Product memory product = products({id : _id, name: _name, Price : _price, default_amount : _default_amount, description : _description});
        products[_id] = product;
        ProductRegistered(_id);
        return true;
        {
            ProductRegistrationFailed(_id);
            return true;
        }
            
    }
    
    function Inventory() onlySeller constant returns (uint256 id, string name, uint256 Price, uint256 default_amount )
    {
        return(id, name, Price, default_amount);
    }

}
