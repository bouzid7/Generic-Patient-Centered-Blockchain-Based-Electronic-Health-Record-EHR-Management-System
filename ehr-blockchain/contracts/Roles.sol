//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
/**
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
    struct Role {
       /*
       It contains a Role struct that consists of a mapping bearer, which associates addresses with
       boolean values to determine membership in the role.
       */
        mapping (address => bool) bearer;
    }
    /**
     * @dev Give an account access to this role.
     */
  /*
  The add function allows an account to be given access to this role. It checks if the account doesn't already have the
  role assigned (!has(role, account)) and then assigns the role to the account by setting role.bearer[account] to true.
  */
    function add(Role storage role, address account) internal {
        require(!has(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }
    /**
     * @dev Remove an account's access to this role.
     */
   /*
    The remove function removes an account's access to this role. It checks if the account has the role assigned
    (has(role, account)) and then revokes the role from the account by setting role.bearer[account] to false.
   */
    function remove(Role storage role, address account) internal {
        require(has(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }
    /**
     * @dev Check if an account has this role.
     * @return bool
     */
     /*
     The has function checks if an account has this role. It verifies that the account is not the zero address and then
     returns true if the account has the role, and false otherwise by accessing the role.bearer[account] mapping.
     */
    function has(Role storage role, address account) internal view returns (bool) {
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}
