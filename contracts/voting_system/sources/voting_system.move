/*
/// Module: voting_system
module voting_system::voting_system;
        ^0x0             ^module name 
*/

// key is an ability 
// owned object needs an address assigned 
// shared object anyone on the blockchain can access
// fields and functions use snake_case naming
// structs use Pascal naming 

module voting_system::dashboard;

use std::string::String;

public struct Proposal has key {
    id: UID,
    title: String, 
    description: String, 
    voted_yes_count: u64, 
    voted_no_count: u64,
    expiration: u64,
    creator: address, 
    voter_registry: vector<address> //vector creates a list, <> specify list of what 
}

public fun create_proposal(
    title: String, 
    description: String, 
    expiration: u64, 
    ctx: &mut TxContext //"Context" object, a way to pass information about the current execution evironment
) {
    let proposal = Proposal {
        id: object::new(ctx),
        title,
        description, 
        voted_yes_count: 0, 
        voted_no_count: 0, 
        expiration, 
        creator: ctx.sender(),  // will get the creator of the proposal through context object
        voter_registry: vector[]
    };

    transfer::share_object(proposal)
}
