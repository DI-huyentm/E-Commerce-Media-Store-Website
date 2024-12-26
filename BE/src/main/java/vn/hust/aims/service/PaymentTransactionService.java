package vn.hust.aims.service;

import vn.hust.aims.service.dto.input.payment.vnpay.VNPayTransactionInput;
import vn.hust.aims.service.dto.output.payment.vnpay.VNPayTransactionOutput;

public interface PaymentTransactionService {
  VNPayTransactionOutput saveVNPayTransaction(VNPayTransactionInput input);
}
