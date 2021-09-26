#!bin/ic-repl-0.1.0 -o
identity private "./private.pem";

let neuron_id = 3543344363;  // The neuron_id is from stake.sh or an existing neuron you own

// Disburse
call nns.manage_neuron(
  record {
    id = opt record { id = neuron_id };
    command = opt variant {
      Disburse = record { to_account = null; amount = null }
    };
    neuron_id_or_subaccount = null;
  },
);
