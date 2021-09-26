#!bin/ic-repl-0.1.0 -o
identity private "./private.pem";

// Staking or top up

let amount = 100_000_000;  // 1 ICP
let memo = 42;  // memo determines neuron id

call ledger.send_dfx(
  record {
    to = neuron_account(private, memo);
    fee = record { e8s = 10_000 };
    memo = memo;
    from_subaccount = null;
    created_at_time = null;
    amount = record { e8s = amount };
  },
);

call nns.claim_or_refresh_neuron_from_account(
  record { controller = opt private; memo = memo }
);

