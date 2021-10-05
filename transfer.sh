#!bin/ic-repl-0.1.0 -o
identity private "./private.pem";

let amount = 249_920_000;
let memo = 0;
let to = "57b1c1272806903f3b77764a28a86d01803c16e0f506b5e56267858f8d163a07";

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
