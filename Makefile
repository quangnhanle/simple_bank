postgres:
	docker run --name postgres12 -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine
createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres12 dropdb --username=root simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/simple_bank?sslmode=disable" -verbose down

test:
	go test -v -cover ./...

sqlc:
	sqlc generate

.PHONY: createdb dropdb postgres migrateup migratedown sqlc