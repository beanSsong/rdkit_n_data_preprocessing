from rdkit import Chem
from rdkit.Chem import Draw

# Get mol object
mol = Chem.MolFromSmiles(“Cc1ccccc1”)

# Convert mol to imag
img = Draw.MolToImage(mol)

# Save image
Draw.MolToFile(mol, './Cc1ccccc1.png’) 

# image open
img.show()
