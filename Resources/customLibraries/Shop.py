from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from time import sleep


@library
class Shop:
    def __init__(self):
        self.selfLib = BuiltIn().get_library_instance('SeleniumLibrary')

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        # - Get web elements
        productTitles = self.selfLib.get_webelements("css:.card-title")
        for idx, productsTitle in enumerate(productTitles):
            if productsTitle.text in productsList:
                self.selfLib.click_button(self.getCardSelector(idx))

        self.selfLib.click_link("css:li.active a")

    def getCardSelector(self, idx):
        return f"xpath:(//*[@class='card-footer'])[{idx+1}]/button"