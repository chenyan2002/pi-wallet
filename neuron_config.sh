#!bin/ic-repl-0.1.1 -o
load "accounts.sh";

// Define neuron config operations
function dissolve_delay(delay) {
  variant {
    IncreaseDissolveDelay = record {
      additional_dissolve_delay_seconds = delay;
    }
  }
};
function start_dissolving() {
  variant {
    StartDissolving = record {}
  }
};
function stop_dissolving() {
  variant {
    StopDissolving = record {}
  }
};
function add_hot_key(hot_key) {
  variant {
    AddHotKey = record { new_hot_key = opt hot_key }
  }
};
function remove_hot_key(hot_key) {
  variant {
    RemoveHotKey = record { hot_key_to_remove = opt hot_key }
  }
};

// Choose a specific operation above to execute
function config_neuron(neuron_id, operation) {
  let _ = call nns.manage_neuron(
    record {
      id = opt record { id = neuron_id };
      command = opt variant {
        Configure = record {
          operation = opt operation;
        }
      };
      neuron_id_or_subaccount = null;
    },
  )
};

config_neuron(neuron_id, dissolve_delay(3600));
