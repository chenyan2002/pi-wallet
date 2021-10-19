#!bin/ic-repl-0.1.0 -o
load "accounts.sh";

// Disburse the entire staked amount to the controller's account
function disburse() {
  variant { Disburse = record { to_account = null; amount = null } }
};
// Spawn rewards to a new neuron under the controller's account
function spawn() {
  variant { Spawn = record { new_controller = null } }
};
// Split off the given number of ICP from a neuron.
function split(amount) {
  variant { Split = record { amount_e8s = amount } }  // 1 ICP
};
// Merge the percentage (between 1 and 100) of the maturity of a neuron into the current stake
function merge_maturity(percent) {
  variant { MergeMaturity = record { percentage_to_merge = percent } }
};

// Choose a specific command above to execute
function manage(neuron_id, cmd) {
  let _ = call nns.manage_neuron(
    record {
      id = opt record { id = neuron_id };
      command = opt cmd;
      neuron_id_or_subaccount = null;
    },
  )
};

manage(neuron_id, merge_maturity(50));
manage(neuron_id, spawn());
