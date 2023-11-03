//
//  CustomNavLink.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import SwiftUI

struct CustomNavLink<Label, Destination> : View where Label : View, Destination : View {
    
    let destination: Destination
    let label: Label
    
    init(
        @ViewBuilder destination: () -> Destination,
        @ViewBuilder label: () -> Label
    ) {
        self.destination = destination()
        self.label = label()
    }
    
    var body: some View {
        NavigationLink {
            CustomNavBarContainerView {
                destination
            }
            .toolbar(.hidden)
        } label: {
            label
        }

    }
}

#Preview {
    CustomNavView{
        CustomNavLink {
            Text("Destination")
        } label: {
            Text("CLick me")
        }

    }

}
