from faker import Faker
fake = Faker()

account_managers = {}

i = 0
while i < 500:
    account_manager = {}
    account_manager["id"] = 12345
    account_manager["value"] = fake.name()
    account_managers.update(account_manager)
    i += 1

print(account_managers)