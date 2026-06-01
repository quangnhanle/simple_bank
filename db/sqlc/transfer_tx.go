package db

type TransferTxParams struct {
	FromAccountID int64
	ToAccountID   int64
	Amount        int64
}

type TransferTxResult struct {
	Transfer    Transfer
	FromEntry   Entry
	ToEntry     Entry
	FromAccount Account
	ToAccount   Account
}
