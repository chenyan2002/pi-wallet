#!bin/ic-repl-0.1.1 -o
identity private "./private.pem";

function transfer(to, amount, memo) {
  call ledger.send_dfx(
    record {
      to = to;
      fee = record { e8s = 10_000 };
      memo = memo;
      from_subaccount = null;
      created_at_time = null;
      amount = record { e8s = amount };
    },
  );
};

// Staking or top up
function stake(amount, memo) {
  transfer(neuron_account(private, memo), amount, memo);
  call nns.claim_or_refresh_neuron_from_account(
    record { controller = opt private; memo = memo }
  );
};

let amount = 100_000_000;  // 1 ICP
let memo = 42;  // memo determines neuron id

stake(amount, memo);

// transfer token out
let to = "624757ad9ca36319ab644059138a73e2c52935238d22e61f3d1159473e1ebc3d";
transfer(to, amount, 0);
