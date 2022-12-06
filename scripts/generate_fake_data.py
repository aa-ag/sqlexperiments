from faker import Faker
fake = Faker()


def make_fake_custom_fields():
    i = 0
    custom_fields = list()
    while i < 501:
        account_manager = dict()
        account_manager["id"] = 12345
        account_manager["value"] = fake.name()

        custom_fields.append(account_manager)

        cc = dict()
        cc["id"] = 6789
        cc["value"] = fake.credit_card_full()

        custom_fields.append(cc)

        i += 1
    print(custom_fields)


make_fake_custom_fields()