from faker import Faker
fake = Faker()


def make_account_managers():
    account_managers = list()
    i = 0
    while i < 501:
        account_manager = dict()
        account_manager["id"] = 12345
        account_manager["value"] = fake.name()
        account_managers.append(account_manager)
        i += 1

    print(account_managers)


make_account_managers()