from rdkit import Chem
from rdkit.Chem import AllChem

mol = Chem.MolFromSmiles(“Cc1ccccc1”)

fpgen = AllChem.GetRDKitFPGenerator()
#fpgen = AllChem.GetAtomPairGenerator()
#fpgen = AllChem.GetMorganGenerator(radius=2)

fps = fpgen.GetFingerprint(mol)

#from rdkit.Chem import MACCSkeys
#fps = MACCSkeys.GenMACCSKeys(mol)

bit_vector = list(fps.GetOnBits())

bit_vector = list(fps.ToBitString())
fp_list = [int(bit) for bit in bit_vector]
	
fp_list
