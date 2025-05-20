from rdkit import Chem
from rdkit.Chem import Draw

import pandas as pd

# Set file direction
file_path = './0.smiles_filtered.csv'

# Load CSV file
df = pd.read_csv(file_path)

# SMILES
smiles_list = df[“Canonical SMILES”]

# Get mol object
mols = [Chem.MolFromSmiles(smiles) for smiles in smiles_list]

img=Draw.MolsToGridImage(mols[:8], molsPerRow=4, subImgSize=(200,200))

img.save('./0.smiles_filtered.png')
