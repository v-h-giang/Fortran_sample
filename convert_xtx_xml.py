# %%
import sys
sys.path.append('.')
from lib import etree 
print(etree.__file__)

# Tạo các element mới để bao bọc
outer_wrapper = etree.Element('outerWrapper')
inner_wrapper = etree.Element('innerWrapper')

# Di chuyển 'innerWrapper' vào 'outerWrapper'
outer_wrapper.append(inner_wrapper)

# Tạo cây mới với 'outerWrapper' là root
new_tree = etree.ElementTree(outer_wrapper)

# Đọc file XML gốc
tree = etree.parse('text.xtx')
root = tree.getroot()

try:
    target_elem = new_tree.xpath("./innerWrapper")[0]
    target_elem.append(root)
except IndexError:
    print("Unable to find target element.")

# "Reset" pretty printing and write to file.
parser = etree.XMLParser(remove_blank_text=True)
etree.ElementTree(etree.fromstring(etree.tostring(new_tree),
                                   parser=parser)).write("wrapped_library.xml",
                                        encoding='utf-8', xml_declaration=True,
                                                         pretty_print=True)
# %%
