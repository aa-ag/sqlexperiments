import pandas as pd
import csv
import json
from faker import Faker
fake = Faker()


def make_fake_custom_fields():
    df1 = pd.read_csv('../fake_data_for_testing.csv')
    i = 0
    custom_fields = list()
    while i < 500:
        field = list()
        account_manager = dict()
        account_manager["id"] = 12345
        account_manager["value"] = fake.name()
        field.append(account_manager)
        
        cc = dict()
        cc["id"] = 6789
        cc["value"] = fake.credit_card_full()
        field.append(cc)

        custom_fields.append(field)
        i += 1
    df2 = pd.DataFrame({"custom_fields":custom_fields})
    df3 = pd.concat([df1,df2],axis=1)
    df3.to_csv("../copy.csv",index=False)


if __name__ == "__main__":
    make_fake_custom_fields()