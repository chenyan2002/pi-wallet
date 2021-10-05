#!bin/ic-repl-0.1.0 -o
identity private "./private.pem";

let neuron_id = 3543344363;  // The neuron_id is from stake.sh or an existing neuron you own

// Disburse the entire staked amount to the controller's account
let disburse = variant { Disburse = record { to_account = null; amount = null } };
// Spawn rewards to a new neuron under the controller's account
let spawn = variant { Spawn = record { new_controller = null } };
// Split off the given number of ICP from a neuron.
let split = variant { Split = record { amount_e8s = 100_000_000 } };  // 1 ICP
// Merge the percentage (between 1 and 100) of the maturity of a neuron into the current stake
let merge_maturity = variant { MergeMaturity = record { percentage_to_merge = 100 } };

// Choose a specific command above to execute
call nns.manage_neuron(
  record {
    id = opt record { id = neuron_id };
    command = opt spawn;
    neuron_id_or_subaccount = null;
  },
);
