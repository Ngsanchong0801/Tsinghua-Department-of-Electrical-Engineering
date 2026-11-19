import torch
import numpy as np
import torch.nn as nn


class QuantileLoss(nn.Module):
    def __init__(self, quantiles):
        super().__init__()
        self.quantiles = quantiles if isinstance(quantiles, list) else [quantiles]

    def forward(self, preds, target):
        assert not target.requires_grad
        assert preds.size(0) == target.size(0)
        losses = []
        for i, q in enumerate(self.quantiles):
            errors = target - preds[:, :, i]
            losses.append((torch.max((q - 1) * errors, q * errors)).unsqueeze(1))
        sum = torch.sum(torch.cat(losses, dim=1), dim=0)
        loss = sum / target.size(0)
        loss = torch.mean(loss)

        return loss
