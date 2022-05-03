import os
import torch
print(f"PyTorch {torch.__version__} from {os.path.dirname(torch.__file__)} has been imported.")
import torchvision
print(f"Torchvision {torchvision.__version__} from {os.path.dirname(torchvision.__file__)} has been imported.")

if torch.cuda.is_available():
    cc_int, cc_decimal = torch.cuda.get_device_capability()
    cc=cc_int+cc_decimal*0.1
    print(f"CUDA device {torch.cuda.get_device_name()} with compute capability {cc} is availabel.")

    # tensor
    ten=torch.randn(2,3).cuda()
    print(ten)
    del ten

    # model
    model=torchvision.models.resnet50().cuda()
    print(f"{model.__class__.__name__} on device {next(model.parameters()).device} is successfully created.")
else:
    print("CUDA is NOT available.")