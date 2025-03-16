package my.calc.calc.service.impl;

import my.calc.calc.service.CalcController;

public class CalculatorImpl implements CalcController {
    @Override
    public float add (float a, float b) { return (a+b); }

    @Override
    public float sub (float a, float b) { return (a-b); }

    @Override
    public float mul (float a, float b) { return (a*b); }

    @Override
    public float div (float a, float b) { return (a/b); }
}
